window.Analytics = {
  trackBlogPostPageView: function(url, callback){
    var hitCallback = callback || function(){};
    var pageViewOptions = {
      hitType: "event",
      eventCategory: "Blog Posts",
      eventAction: "click",
      eventLabel: url,
      hitCallback: hitCallback,
    }

    ga("send", pageViewOptions);
  },

  trackExternalBlogPost: function(url){
    var followLink = function(){
      document.location = url;
    }
    Analytics.trackBlogPostPageView(url, followLink);
  },

  successfullyLoaded: function(){
    return window.gaGlobal !== undefined;
  }
};

$(function(){
  if(Analytics.successfullyLoaded()){
    $(document).on("click", ".archive--title-link", function(e){
      url = $(e.target).attr("href")

      if(url.match("^http")){
        Analytics.trackExternalBlogPost(url);
        return false;
      } else {
        return true;
      }
    });
  }
});
