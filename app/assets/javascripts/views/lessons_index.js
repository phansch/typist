Typist.Views.LessonsIndex = Backbone.View.extend({
  render: function () {
    var self = this;
    this.$el.html(JST['lessons/index']()); // Note that no collection is needed to build the container markup.
    this.collection.each(function(lesson) {
      var lessonView = new Typist.Views.LessonView({ model: lesson});
      self.$('table').append(lessonView.render().el);
    });
    return this;
  }
});
