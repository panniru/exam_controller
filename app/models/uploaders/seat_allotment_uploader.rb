class SeatAllotmentUploader
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Uploader

  def persisted?
    false
  end

  def initialize(params = {})
    super(params[:file])
  end

  def save
    super do |row|
      seat = SeatAllotment.find_by_id(row["id"]) || SeatAllotment.new
      seat.attributes = row.to_hash.slice(*columns)
      seat
    end
  end

  def xls_template(options)
    CSV.generate(options) do |csv|
      csv << SeatAllotment.columns_defined
    end
  end

  def columns
    @columns = @columns ||  SeatAllotment.columns_defined
  end


end
