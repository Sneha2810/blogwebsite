<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dau.PostDao"%>
<div class="row">

<%
    //Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid=Integer.parseInt(request.getParameter("cid"));
         List<Post> posts = null;
        if(cid==0){
        
        
        posts=d.getAllPosts();
    }else{
    posts=d.getPostByCatId(cid);
    }
    if(posts.size()==0)
    {
    out.println("<h3 class='display-3 text-center'>No posts in this category yet..</h3>");
    return;
    }
        for(Post p:posts)
        {
        %>
        <div class="col-md-6 mt-2">
            <div class="card">
                  <img class="card-img-top" src="blog_pics/<%=p.getpPic()  %>" alt="Card image cap">

                <div class="card-body">
                    <b><%= p.getpTitle() %> </b>
                    <p> <%=p.getpContent() %></p>
                </div> 
                <div class="card-footer primary-background text-center">
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span>10 </span> </i></a>

                    <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more..</a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20 </span> </i></a>
                    
                    
                </div>
                
                
            </div>
        </div>
        
        
        <%
}
%>
</div>