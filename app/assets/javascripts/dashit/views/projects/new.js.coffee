DashIt.NewProjectView = Ember.View.extend
  tagName: "form"
  templateName: "dashit/templates/projects/edit"
  init: ->
    @_super()
    @set "project", DashIt.Project.create()

  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @get("parentView").hideNew()

  submit: (event) ->
    self = @
    project = @get("project")
    event.preventDefault()
    project.saveResource().fail((e) ->
      console.log e
    ).done ->
      DashIt.projectsController.pushObject project
      self.get("parentView").hideNew()

