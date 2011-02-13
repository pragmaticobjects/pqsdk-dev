<%inherit file="_templates/site.mako" />

<ul>
% for post in bf.config.blog.posts[:5]:
    <%include file="post.mako" args="post=post" />
    <hr>
% endfor
</ul>
    
<script>
	$j('#page-blog').addClass('active');
</script>    