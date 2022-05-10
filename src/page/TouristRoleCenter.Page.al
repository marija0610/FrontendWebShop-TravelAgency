page 50300 "TouristRoleCenter"
{
    Caption = 'TouristRoleCenter';
    PageType = RoleCenter;
    //SourceTable = "";

    layout
    {
        area(RoleCenter)
        {
            group(MyGroup)
            {
                Caption = 'RoleCenter Group';

                part(TouristActivity; TouristActivity)
                {
                    Caption = 'TouristActivity';
                }

                part(CustomerListPart; CustomerListPart)
                {
                    Caption = 'Customer List Part';
                }
            }
        }
    }


}
