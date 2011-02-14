<%inherit file="base.mako" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        ${self.head()}
    </head>
    
    <body>
        <div class="container">
            ${self.header()}            
                        
            <div class="span-15 colborder">
                ${next.body()}
            </div>
                
            <div class="span-7 last">
                ${self.sidebar()}
            </div>    
            
            ${self.footer()}
        </div>
    </body>
    
</html>
<%def name="head()">
    <%include file="head.mako" />
</%def>
<%def name="header()">
    <%include file="header.mako" />
</%def>
<%def name="footer()">
    <%include file="footer.mako" />
</%def>
<%def name="sidebar()">
    <%include file="sidebar.mako" args="posts=posts" />
</%def>