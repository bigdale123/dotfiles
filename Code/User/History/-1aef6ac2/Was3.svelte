<script>
  import "../app.css";
  import {page} from '$app/stores';
</script>

<div class="bg-cover bg-[url('/UAB_Blazer_Hall-3738225094.jpg')]">
    <div class="p-2">
        <!-- NavBar will go here -->
        <div class="bg-white/75 backdrop-blur-md rounded-lg px-2">
            <a class="px-2" href="/" aria-current={$page.url.pathname === '/'}>Home</a>
            <a class="px-2" href="/resume" aria-current={$page.url.pathname === '/resume'}>Resume</a>
            <a class="px-2" href="/projects" aria-current={$page.url.pathname === '/projects'}>Projects</a>
        </div>
    </div>
    <slot />
</div>