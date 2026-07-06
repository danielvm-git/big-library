<script>
  import { onMount } from 'svelte';
  
  let token = null;
  let email = '';
  let password = '';
  let loading = false;
  let error = '';

  onMount(() => {
    token = localStorage.getItem('bigbase_jwt');
    // Dispatch event to notify layout of token, if needed
    if (token) {
      window.dispatchEvent(new CustomEvent('auth-success', { detail: { token } }));
    }
  });

  async function handleLogin(e) {
    e.preventDefault();
    loading = true;
    error = '';
    
    try {
      const res = await fetch('https://bigbase.click/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password })
      });
      
      if (!res.ok) {
        throw new Error('Invalid credentials');
      }
      
      const data = await res.json();
      token = data.token; 
      localStorage.setItem('bigbase_jwt', token);
      window.dispatchEvent(new CustomEvent('auth-success', { detail: { token } }));
    } catch (err) {
      error = err.message;
    } finally {
      loading = false;
    }
  }
</script>

{#if !token}
  <div class="login-overlay">
    <div class="card login-card">
      <div class="card-header" style="text-align: center; margin-bottom: var(--space-4);">
        <h2 class="ds-h2">Sign in to Big Library</h2>
        <p class="ds-caption" style="margin-top: var(--space-2);">Use your BigBase account</p>
      </div>
      
      {#if error}
        <div style="color: var(--error); margin-bottom: var(--space-4); text-align: center;">{error}</div>
      {/if}

      <form on:submit={handleLogin} style="display: flex; flex-direction: column; gap: var(--space-4);">
        <div>
          <label class="ds-caption" style="display: block; margin-bottom: var(--space-1);">Email</label>
          <input type="email" class="input" bind:value={email} required />
        </div>
        
        <div>
          <label class="ds-caption" style="display: block; margin-bottom: var(--space-1);">Password</label>
          <input type="password" class="input" bind:value={password} required />
        </div>
        
        <button type="submit" class="btn btn-primary btn-block" disabled={loading} style="margin-top: var(--space-2);">
          {#if loading}Signing in...{:else}Sign in{/if}
        </button>
      </form>
    </div>
  </div>

  <style>
    .login-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background: var(--bg-default);
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 1000;
    }
    .login-card {
      width: 100%;
      max-width: 400px;
      padding: var(--space-8);
      box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
    }
  </style>
{/if}
