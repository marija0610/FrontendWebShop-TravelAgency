codeunit 50305 "Create Reservation Tracking"
{
    TableNo = Reservation;

    trigger OnRun()
    var
        TrackingReservations: Record "Tracking Reservations";
        i: Date;
    begin
        for i := Rec."Starting Date" to Rec."Ending Date" do begin
            TrackingReservations.Init();
            TrackingReservations.No := 0;
            TrackingReservations."Hotel No." := Rec."Hotel No.";
            TrackingReservations."Room No." := Rec.GetFreeRoomNo();
            TrackingReservations."Customer No." := Rec."Customer No.";
            TrackingReservations."Reservation Date" := i;
            TrackingReservations.Insert(true);
        end;
    end;

}