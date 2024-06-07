<script>
  import "../app.css";
  import {page} from '$app/stores';
</script>

<div class="bg-cover bg-[url('/UAB_Blazer_Hall-3738225094.jpg')]">
    <div class="p-2">
        <!-- NavBar will go here -->
        <div class="bg-white/75 backdrop-blur-md rounded-lg py-1 px-2">
            <a class="px-2" href="/" aria-current={$page.url.pathname === '/'}>Home</a>
            <a class="px-2" href="/resume" aria-current={$page.url.pathname === '/resume'}>Resume</a>
            <a class="px-2" href="/projects" aria-current={$page.url.pathname === '/projects'}>Projects</a>
        </div>
        <i></i>
        <div>
            <a class="p-1" href="https://github.com/bigdale123"><i class="bg-[url('/github.png')]"> </i></a>
            <a class="p-1" href="https://www.linkedin.com/in/dylancalvin/"><i class="bg-[url('/linkedin.png')]"> </i></a>
        </div>
    </div>
    <slot />
</div>