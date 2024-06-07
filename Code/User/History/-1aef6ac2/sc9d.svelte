<script>
  import "../app.css";
  import {page} from '$app/stores';
</script>

<div class="p-1 bg-cover bg-[url('/UAB_Blazer_Hall-3738225094.jpg')]">
    <div class="flex bg-white/60 backdrop-blur-sm rounded-lg p-2">
        <!-- NavBar will go here -->
        <div>
            <a class="px-2 align-middle" href="/" aria-current={$page.url.pathname === '/'}>Home</a>
            <a class="px-2 align-middle" href="/resume" aria-current={$page.url.pathname === '/resume'}>Resume</a>
            <a class="px-2 align-middle" href="/projects" aria-current={$page.url.pathname === '/projects'}>Projects</a>
        </div>
        <i class="flex-auto"> </i>
        <div class="flex">
            <a class="px-1" href="https://github.com/bigdale123"><img class="icon-rules" src="github.png" alt="Github"></a>
            <a class="px-1" href="https://www.linkedin.com/in/dylancalvin/"><img class="icon-rules" src="linkedin.png" alt="LinkedIn"></a>
        </div>
    </div>
    <slot />
</div>

<style>
    .icon-rules {
        width: 25px;
        height: 25px;
    }
</style>