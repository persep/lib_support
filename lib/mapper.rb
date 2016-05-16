class ActionDispatch::Routing::Mapper
  REF_ACTIONS = [:index, :show, :update, :new, :create, :remove, :index_items]

  class RefResource < Resource
    def actions
      klass = resource_controller_class

      super.delete_if {|k| !klass.ref_actions.include?(k) }
    end

    def initialize(entities, api_only, shallow, options = {})
      super

      klass = resource_controller_class
      @param = klass.id_column if klass.respond_to?(:id_column)
    end

    def default_actions
      REF_ACTIONS
    end

    protected

    def resource_controller_class
      "#{@controller.to_s.camelize}Controller".constantize
    end
  end

  def ref_resources(*resources, &block)
    options = resources.extract_options!.dup
    return self if apply_common_behavior_for(:ref_resources, resources, options, &block)

    with_scope_level(:resources) do
      options = apply_action_options options
      resource_scope(RefResource.new(resources.pop, api_only?, @scope[:shallow], options)) do
        yield if block_given?

        concerns(options[:concerns]) if options[:concerns]

        collection do
          get    :index       if parent_resource.actions.include?(:index)
          post   :create      if parent_resource.actions.include?(:create)
          get    :index_items if parent_resource.actions.include?(:index_items)
          delete :remove      if parent_resource.actions.include?(:remove)
        end

        new do
          get :new
        end if parent_resource.actions.include?(:new)

        set_member_mappings_for_resource
      end
    end

    self
  end
end