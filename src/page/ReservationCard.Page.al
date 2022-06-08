page 50312 "Reservation Card"
{
    Caption = 'Reservation Card';
    PageType = Card;
    SourceTable = Reservation;
    UsageCategory = None;

    layout
    {
        area(content)
        {

            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Hotel No."; Rec."Hotel No.")
                {
                    ToolTip = 'Specifies the value of the Hotel No. field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Hotel Name"; Rec."Hotel Name")
                {
                    ToolTip = 'Specifies the value of the Hotel Name field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Hotel Address"; Rec."Hotel Address")
                {
                    ToolTip = 'Specifies the value of the Hotel Address field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Destination; Rec.Destination)
                {
                    ToolTip = 'Specifies the value of the Destination field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group(CustomerInfo)
            {
                Caption = 'Customer Information';
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }

                field("E-Mail"; Rec."E-mail")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }

            }

            group(ResrvationInfo)
            {
                Caption = 'Reservation informations';
                field("Room Type"; Rec."Room Type")
                {
                    ToolTip = 'Specifies the value of the Room Type field.';
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                }

                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
                field("Total Price"; Rec."Total Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
                // field("Payment method"; Rec."Payment method")
                // {
                //     ToolTip = 'Specifies the value of the Payment method field.';
                //     ApplicationArea = All;
                //     Visible = false;
                // }

                field("Card payment amount"; Rec."Card payment amount")
                {
                    ToolTip = 'Specifies the value of the Card payment amount field.';
                    ApplicationArea = All;
                }

                field("Cash payment amount"; Rec."Cash payment amount")
                {
                    ToolTip = 'Specifies the value of the Cash payment amount field.';
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Pay")
            {
                ToolTip = 'Executes the Pay Acton';
                Caption = 'Pay';
                Image = Payment;
                trigger OnAction()
                var
                    TrackingReservation: Record "Tracking Reservations";
                    SendSalesInvoice: Codeunit SendSalesInvoice;
                    CreateReservationTracking: Codeunit "Create Reservation Tracking";
                    CreateGeneralJournal: Codeunit "Create General Journal";
                begin
                    if not TrackingReservation.CheckFreeRoom(Rec) then
                        Error('There is no free %3 rooms in choosen period. From %1 to %2', Rec."Starting Date", Rec."Ending Date", Lowercase(Format(Rec."Room Type")));
                    SendSalesInvoice.Run(Rec);
                    CreateGeneralJournal.Run(Rec);
                    Rec.SetFreeRoomNo(TrackingReservation.GetRangeMin("Room No."));
                    CreateReservationTracking.Run(Rec);
                    Message('You have seccesfully reserved room number: %1.', Rec.GetFreeRoomNo());
                    CurrPage.Close();
                end;
            }
        }
    }

}
