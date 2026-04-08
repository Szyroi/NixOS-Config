<script lang="ts">
    import { invoke } from "@tauri-apps/api/core";
    import "../styles/page.css";

    let name = $state("");
    let greetMsg = $state("");

    async function greet(event: Event) {
        event.preventDefault();

        greetMsg = await invoke("greet", { name });
    }
</script>

<main class="flex flex-col justify-center text-center pt-10">
    <h1 class="text-3xl font-bold">Welcome to Tauri + Svelte</h1>

    <div class="flex justify-center">
        <a href="https://vite.dev" target="_blank">
            <img src="/vite.svg" class="logo vite" alt="Vite Logo" />
        </a>
        <a href="https://tauri.app" target="_blank">
            <img src="/tauri.svg" class="logo tauri" alt="Tauri Logo" />
        </a>
        <a href="https://svelte.dev" target="_blank">
            <img
                src="/svelte.svg"
                class="logo svelte-kit"
                alt="SvelteKit Logo"
            />
        </a>
    </div>
    <p>Click on the Tauri, Vite, and SvelteKit logos to learn more.</p>

    <form class="row" onsubmit={greet}>
        <input
            id="greet-input"
            placeholder="Enter a name..."
            bind:value={name}
        />
        <button type="submit">Greet</button>
    </form>
    <p>{greetMsg}</p>
</main>
