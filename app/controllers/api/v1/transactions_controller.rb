module API
  module V1
    class TransactionsController < BaseController

      def create
        target = find_target
        TransactionCreator.new.create(current_user, target, params[:change].to_i)
      end

      private

      def find_target
        find_group.users.find(params[:to])
      end

      def find_group
        @group ||= current_user.groups.find(params[:id])
      end

    end
  end
end