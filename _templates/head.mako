<title>
    ${bf.config.blog.name}
</title>
<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed')}"
/>
<link rel="alternate" type="application/atom+xml" title="Atom 1.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom')}"
/>
% for css_file in bf.config.filters.syntax_highlight.mod.css_files_written:
<link rel='stylesheet' href='${css_file}' type='text/css' />
% endfor
<link rel='stylesheet' href='/css/screen.css' type='text/css' media="screen, projection"
/>
<link rel='stylesheet' href='/css/print.css' type='text/css' media="print"
/>
<!--[if lt IE 8]>
    <link rel="stylesheet" href="/css/ie.css" type="text/css" media="screen, projection">
<![endif]-->
<link rel='stylesheet' href='/css/app.css' type='text/css' media="screen, projection"
/>
<link rel='stylesheet' href='/css/fancy.css' type='text/css' media="screen, projection"
/>

<script type="text/javascript" src="/js/jquery-1.4.2.min.js">
</script>
<script type="text/javascript" src="/js/googleRSSWidget.js">
</script>
<script type="text/javascript" src="/js/site.js">
</script>