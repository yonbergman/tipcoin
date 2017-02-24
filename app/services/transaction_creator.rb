class TransactionCreator

  def create(src, dst, amount)
    neg_amount = -1 * amount
    GroupUserAction.create(src_user: src, target_user: dst, change: amount)
    GroupUserAction.create(src_user: src, target_user: dst, change: neg_amount)
    # Notify other user
  end

end