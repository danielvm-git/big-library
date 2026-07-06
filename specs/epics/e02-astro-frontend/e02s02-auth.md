# e02s02: Svelte Login & JWT Integration

## 1. Description
This story implements the authentication barrier for the Big Library application. It builds a Svelte login component that authenticates against the BigBase Auth API endpoint (`POST /api/auth/login`).
Upon successful authentication, the resulting JWT is securely stored in `localStorage` (for subsequent API/MCP requests) and handled gracefully in the frontend state.

## 2. Success Criteria
- Svelte Login component (`Login.svelte`) is created.
- Form submits email/password payload to `https://bigbase.click/api/auth/login` (or relevant BigBase REST endpoint).
- The JWT is extracted from the response and stored securely in the browser.
- The UI reflects authentication state (showing login form if unauthenticated, showing library content if authenticated).
- The JWT is accessible for injecting into Bearer headers for future MCP server requests.

## 3. Implementation Tasks
1. Scaffold `Login.svelte` UI according to April Green DS.
2. Implement form submission logic and BigBase Auth API integration.
3. Handle JWT response, store it locally, and implement auth state management in Astro/Svelte.

## 4. Test Plan
- Run dev server and attempt login with mock credentials.
- Verify JWT is successfully saved to `localStorage`.
- Verify the login form disappears and grants access to the app layout upon successful auth.
