import os
import sys
import json
import time
import urllib.request
import urllib.error

# Configuração
BIGBASE_EMAIL = os.environ.get("BIGBASE_EMAIL")
BIGBASE_PASSWORD = os.environ.get("BIGBASE_PASSWORD")
BIGBASE_SITE_ID = os.environ.get("BIGBASE_SITE_ID")
SITE_URL = os.environ.get("BIGBASE_SITE_URL", "https://library.bigbase.click")

def main():
    if not all([BIGBASE_EMAIL, BIGBASE_PASSWORD, BIGBASE_SITE_ID]):
        print("Erro: As variáveis de ambiente BIGBASE_EMAIL, BIGBASE_PASSWORD e BIGBASE_SITE_ID são obrigatórias.")
        sys.exit(1)

    print("1. Efetuando login no BigBase...")
    login_data = json.dumps({"email": BIGBASE_EMAIL, "password": BIGBASE_PASSWORD}).encode('utf-8')
    req_login = urllib.request.Request("https://bigbase.click/api/auth/login", data=login_data, headers={"Content-Type": "application/json"})
    
    try:
        with urllib.request.urlopen(req_login) as response:
            res_data = json.loads(response.read().decode('utf-8'))
            jwt_token = res_data.get("token")
            if not jwt_token:
                print("Erro: JWT não retornado.")
                sys.exit(1)
    except Exception as e:
        print(f"Erro no login: {e}")
        sys.exit(1)

    print("2. Disparando deploy...")
    deploy_data = json.dumps({
        "branch": "main",
        "app_type": "static",
        "passthrough_paths": ["/mcp"]
    }).encode('utf-8')
    
    req_deploy = urllib.request.Request(
        f"https://bigbase.click/api/sites/{BIGBASE_SITE_ID}/deploy",
        data=deploy_data,
        headers={
            "Authorization": f"Bearer {jwt_token}",
            "Content-Type": "application/json"
        }
    )

    try:
        with urllib.request.urlopen(req_deploy) as response:
            if response.status not in (200, 201, 202):
                print(f"Erro no deploy: HTTP {response.status}")
                sys.exit(1)
            print("Deploy iniciado com sucesso!")
    except Exception as e:
        print(f"Erro no deploy: {e}")
        sys.exit(1)

    print(f"3. Aguardando health check em {SITE_URL}...")
    for i in range(1, 9):
        try:
            req_health = urllib.request.Request(SITE_URL)
            with urllib.request.urlopen(req_health) as response:
                if response.status == 200:
                    print("✅ Site is LIVE and healthy!")
                    sys.exit(0)
        except urllib.error.HTTPError as e:
            print(f"Attempt {i}/8: Got HTTP {e.code}. Retrying in 10s...")
        except urllib.error.URLError as e:
            print(f"Attempt {i}/8: Got URL Error {e.reason}. Retrying in 10s...")
        
        time.sleep(10)

    print("❌ Health check failed after 8 attempts.")
    sys.exit(1)

if __name__ == "__main__":
    main()
