page 50300 "TouristRoleCenter"
{
    Caption = 'TouristRoleCenter';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(HeadlineRC; "Headline RC Tourist")
            {
                ApplicationArea = All;
            }

            part(LoginPart; "Login Info")
            {
                Caption = 'Log in or create account here';

            }

            part(TouristActivity; TouristActivity)
            {
                Caption = 'Tourist Activity';
            }

            part(ArrangementListPart; "Arrangements List Part")
            {
                Caption = 'List of all arrangements';
            }

            part(CustomersReservationPart; "Customers Reservations")
            {
                Caption = 'List of your reservations';
            }

        }

    }

    actions
    {
        area(Processing)
        {
            action("All Arrangements")
            {
                Caption = 'All Arrangements';
                RunObject = Page "Item List";
                ToolTip = 'Specifies the action for showing All Arrangements';
            }

            action("History of customers reservations")
            {
                Caption = 'History of customers reservations';
                RunObject = Page "Customers Reservations";
                ToolTip = 'Specifies the action for showing History of customers reservations';
            }

        }
    }


}
