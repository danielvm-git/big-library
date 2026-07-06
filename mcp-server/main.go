package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/mark3labs/mcp-go/mcp"
	"github.com/mark3labs/mcp-go/server"
)

func main() {
	s := server.NewMCPServer("BigLibraryMCP", "1.0.0")

	// Add a tool to read markdown chunks
	tool := mcp.NewTool("read_book_chunk",
		mcp.WithDescription("Read a specific OKF markdown chunk by providing a search query or a filename snippet."),
		mcp.WithString("query", mcp.Required(), mcp.Description("A filename or topic snippet to look for in the markdown chunks.")),
	)

	s.AddTool(tool, func(ctx context.Context, request mcp.CallToolRequest) (*mcp.CallToolResult, error) {
		args, ok := request.Params.Arguments.(map[string]interface{})
		if !ok {
			return mcp.NewToolResultError("invalid arguments type"), nil
		}
		query, ok := args["query"].(string)
		if !ok {
			return mcp.NewToolResultError("query argument missing or invalid"), nil
		}

		contentPath := "../src/content/books"
		result := ""
		
		err := filepath.Walk(contentPath, func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if !info.IsDir() && strings.HasSuffix(info.Name(), ".md") {
				if strings.Contains(strings.ToLower(path), strings.ToLower(query)) {
					data, err := os.ReadFile(path)
					if err == nil {
						text := string(data)
						if len(text) > 10000 {
							text = text[:10000] + "...\n[TRUNCATED]"
						}
						result += fmt.Sprintf("=== File: %s ===\n%s\n\n", info.Name(), text)
					}
				}
			}
			return nil
		})
		
		if err != nil {
			return mcp.NewToolResultError(err.Error()), nil
		}
		
		if result == "" {
			result = "No matching chunks found."
		}

		return mcp.NewToolResultText(result), nil
	})

	sse := server.NewSSEServer(s)

	mux := http.NewServeMux()
	
	// JWT Validation Middleware
	authMiddleware := func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			// Basic CORS
			w.Header().Set("Access-Control-Allow-Origin", "*")
			w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
			w.Header().Set("Access-Control-Allow-Headers", "Authorization, Content-Type")
			
			if r.Method == "OPTIONS" {
				w.WriteHeader(http.StatusOK)
				return
			}

			authHeader := r.Header.Get("Authorization")
			if authHeader == "" || !strings.HasPrefix(authHeader, "Bearer ") {
				http.Error(w, "Unauthorized - Missing Bearer Token", http.StatusUnauthorized)
				return
			}
			token := strings.TrimPrefix(authHeader, "Bearer ")
			if token != "big_library_mcp_b4d8_token" {
				http.Error(w, "Unauthorized - Invalid Token", http.StatusUnauthorized)
				return
			}
			
			next.ServeHTTP(w, r)
		})
	}

	mux.Handle("/mcp", authMiddleware(sse.SSEHandler()))
	mux.Handle("/message", authMiddleware(sse.MessageHandler()))

	port := "8080"
	log.Printf("Starting BigBase MCP server on :%s", port)
	if err := http.ListenAndServe(":"+port, mux); err != nil {
		log.Fatalf("Server error: %v", err)
	}
}
