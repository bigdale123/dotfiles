<script>
  import "../app.css";
  import {page} from '$app/stores';
</script>

<div class="bg-cover bg-[url('/UAB_Blazer_Hall-3738225094.jpg')]">
    <div class="flex bg-white/60 backdrop-blur-sm rounded-lg p-2">
        <!-- NavBar will go here -->
        <div>
            <a class="px-2" href="/" aria-current={$page.url.pathname === '/'}>Home</a>
            <a class="px-2" href="/resume" aria-current={$page.url.pathname === '/resume'}>Resume</a>
            <a class="px-2" href="/projects" aria-current={$page.url.pathname === '/projects'}>Projects</a>
        </div>
        <i class="flex-auto"> </i>
        <div>
            <a class="" href="https://github.com/bigdale123"><img class="icon-rules" src="github.png" alt="Github"></a>
            <a class="" href="https://www.linkedin.com/in/dylancalvin/"><img class="icon-rules" src="linkedin.png" alt="LinkedIn"></a>
        </div>
    </div>
    <slot />
</div>

<style>
    .icon-rules {
        width: 256px;
        height: 256px;
    }
</style>