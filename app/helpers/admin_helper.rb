module AdminHelper
  def new
    resource = resource_class.new
    authorize_resource(resource)
    render locals: {
      page: Administrate::Page::Form.new(dashboard, resource),
    }
  end

  def edit
    render locals: {
      page: Administrate::Page::Form.new(dashboard, requested_resource),
    }
  end

  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    if resource.save
      redirect_to(
        action: :index,
        # [namespace, resource],
        notice: translate_with_resource("create.success"),
      )
    else
      render :new, locals: {
        page: Administrate::Page::Form.new(dashboard, resource),
      }
    end
  end

  def update
    if requested_resource.update(resource_params)
      redirect_to(
        action: :index,
        # [namespace, requested_resource],
        notice: translate_with_resource("update.success"),
      )
    else
      render :edit, locals: {
        page: Administrate::Page::Form.new(dashboard, requested_resource),
      }
    end
  end

  def destroy
    # if requested_resource.destroy
    if requested_resource
      # flash[:notice] = translate_with_resource("destroy.success")
      flash[:notice] = "your task cannot be destroyed by \'destroy\' button :V"
    else
      flash[:error] = requested_resource.errors.full_messages.join("<br/>")
    end
    redirect_to action: :index
  end
end

