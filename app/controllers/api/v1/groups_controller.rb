module API
  module V1
    class GroupsController
      def create
        group = Group.create(name: params[:name])
        group.group_users.create(user: current_user, owner: true)
        render json: group, status: :created
      end

      def show
        group = current_group
        if group
          render json: group
        else
          head :not_found
        end
      end

      def index
        groups = current_user.groups
        render json: groups
      end

      def invite_user
        email = params[:email]
        user = User.find_by(email: email)
        if user
          if current_group.users.include? user
            head :ok
          else
            current_group.group_users.create(user: user)
            head :created
          end
        else
          # Invite to site
        end
      end

      private

      def current_group
        @group ||= current_user.groups.find(params[:id])
      end
    end
  end
end