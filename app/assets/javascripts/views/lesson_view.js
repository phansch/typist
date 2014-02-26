Typist.Views.LessonView = Backbone.View.extend({
  tagName: 'tr',

  initialize: function () {

  },

  render: function () {
    this.$el.html(JST['lessons/view']({ model: this.model }));
    return this;
  }
});
