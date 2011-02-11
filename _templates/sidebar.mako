<% import urlparse %>
<div id="search">
    <h3>
        Search
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
    </h3>
<div>
<hr>    
<div id="blog_post_list">
    <h3>
        Latest blog posts
    </h3>
    <ul>
        % for post in bf.config.blog.posts[:5]:
        <li>
            <a href="${post.path}">${post.title}</a>
        </li>
        % endfor
    </ul>
</div>
<hr>
<div id="categories">
    <h3>
        Categories
    </h3>
    <ul>
        % for category, num_posts in bf.config.blog.all_categories:
        <li>
            <a href="${category.path}">${category}</a>
            (
            <a href="${category.path}/feed">rss</a>
            ) (${num_posts})
        </li>
        % endfor
    </ul>
</div>
<hr>
<div id="archives">
    <h3>
        Archives
    </h3>
    <ul>
        % for link, name, num_posts in bf.config.blog.archive_links:
        <li>
            <a href="${bf.util.site_path_helper(bf.config.blog.path,link)}/1" title="${name}">${name}</a>
            &nbsp;(${num_posts})
        </li>
        % endfor
    </ul>
</div>
<hr>