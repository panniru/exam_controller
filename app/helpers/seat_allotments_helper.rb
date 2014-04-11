module SeatAllotmentsHelper
    def allotments_btn_group
    links = []
    links << link_to("Add Allotment", new_seat_allotment_path, :class => "btn btn-primary")
    links << link_to("Upload Allotments", new_allotment_upload_seat_allotments_path)
    ApplicationHelper.btn_group(links)
  end
end
