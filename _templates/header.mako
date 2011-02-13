<% import urlparse %>
    <div id="header" onclick="location.href='${bf.util.site_path_helper()}';"
    style="cursor: pointer;">
        <!--
        <div id="plugbanner">
        </div>
        <div id="blog_logo">
        </div>

        <h1>
            <a href="/">
            <span id="blog_name">
            ${bf.config.blog.name}
            </span>
            </a>
        </h1>
        -->
    </div>
    <!--
    <div class="tab-menu">
        <ul>
            <li>
                <a href="/">Blog</a>
            </li>
            <li>
                <a href="${bf.util.site_path_helper('/projects')}">Projects</a>
            </li>
            <li>
                <a href="${bf.util.site_path_helper('/about')}">About</a>
            </li>
        </ul>
    </div>
    <div id="search">
        <form id="searchform" method="get" action="http://www.google.com/search">
            <input type="hidden" name="ie" value="UTF-8">
            <input type="hidden" name="oe" value="UTF-8">
            <input type="hidden" name="domains" value="${urlparse.urlparse(bf.config.site.url)[1]}">
            <input type="hidden" name="sitesearch" value="${urlparse.urlparse(bf.config.site.url)[1]}">
            <input name="q" id="q" size="20" value="search in blog..." onfocus="if(this.value==this.defaultValue) this.value='';"
            type="text">
        </form>
    </div>
    -->
    <hr> 
    <h2>
        <a href="/">
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