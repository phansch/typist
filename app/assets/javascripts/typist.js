window.Typist = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(data) {
    this.lessons = new Typist.Collections.Lessons(data.lessons);
    new Typist.Routers.Lessons();
    Backbone.history.start();
  }
};
