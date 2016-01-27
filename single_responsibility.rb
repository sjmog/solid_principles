class DealProcessor
  def initialize(deals)
    @deals = deals
  end

  def process
    @deals.each do |deal|
      mark_deal_processed(deal)
      CommissionCalculator.new.create_commission(deal)
    end
  end

  private

  def mark_deal_processed(deal)
    deal.processed = true
    deal.save!
  end
end

class ComissionCalculator
  def create_commission(deal)
    Commission.create(deal: deal, amount: calculate_commission(deal))
  end

  private

  def calculate_commission(deal)
    deal.dollar_amount * 0.08
  end
end