<script>
  import "../app.css";
  import {page} from '$app/stores';
</script>

<div class="bg-cover bg-[url('/UAB_Blazer_Hall-3738225094.jpg')]">
    <div class="bg-white/75 backdrop-blur-md rounded-lg py-1 px-2">
        <!-- NavBar will go here -->
        <div>
            <a class="px-2" href="/" aria-current={$page.url.pathname === '/'}>Home</a>
            <a class="px-2" href="/resume" aria-current={$page.url.pathname === '/resume'}>Resume</a>
            <a class="px-2" href="/projects" aria-current={$page.url.pathname === '/projects'}>Projects</a>
        </div>
        <i></i>
        <div>
            <a class="" href="https://github.com/bigdale123"><i class="bg-[url('/github.png')]">Github</i></a>
            <a class="" href="https://www.linkedin.com/in/dylancalvin/"><i class="bg-[url('/linkedin.png')]">LinkedIn</i></a>
        </div>
    </div>
    <slot />
</div>