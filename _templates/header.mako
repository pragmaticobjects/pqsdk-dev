<% import urlparse %>
    <div id="header" onclick="location.href='${bf.util.site_path_helper()}';"
    style="cursor: pointer;">        
    </div>    
    <hr> 
    <h2>
        <a href="/" class="blog_name">
        <span id="blog_name">
            ${bf.config.blog.name}
        </span>
        </a>
    </h2>
             
    <hr> 
    <h2 class="alt">Passionate quest for Software Development Knowledge.</h2> 
    <hr>
    <div class="tab-menu">
	    <ul>
	        <li id="page-blog" >
	            <a href="/">Blog</a>
	        </li>
	        <li id="page-project" >
	            <a href="${bf.util.site_path_helper('/projects')}">Projects</a>
	        </li>
	        <li id="page-about" >
	            <a href="${bf.util.site_path_helper('/about')}">About</a>
	        </li>
	    </ul>
	</div>
	<hr class="space">