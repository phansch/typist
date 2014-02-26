Typist.Routers.Lessons = Backbone.Router.extend({
  routes: {
    "": "index",
  },

  index: function() {
    var view = new Typist.Views.LessonsIndex({ collection: Typist.lessons });
    $('.container').html(view.render().$el);
  }}
);
