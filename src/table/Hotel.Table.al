// table 50304 "Hotel"
// {
//     Caption = 'Hotel';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "No."; Integer)
//         {
//             Caption = 'No.';
//             DataClassification = SystemMetadata;
//             AutoIncrement = true;
//         }
//         field(2; Name; Text[100])
//         {
//             Caption = 'Name';
//             DataClassification = CustomerContent;
//         }
//         field(3; Address; Text[150])
//         {
//             Caption = 'Address';
//             DataClassification = CustomerContent;
//         }
//         field(4; "Destination No."; Code[20])
//         {
//             Caption = 'Destination No.';
//             DataClassification = SystemMetadata;
//             TableRelation = Destination;
//         }

//         field(5; "No. of single rooms"; Integer)
//         {
//             Caption = 'No. of single rooms';
//             DataClassification = CustomerContent;
//         }
//         field(6; "No. of double rooms"; Integer)
//         {
//             Caption = 'No. of double rooms';
//             DataClassification = CustomerContent;
//         }
//         field(7; "No. of triple rooms"; Integer)
//         {
//             Caption = 'No. of triple rooms';
//             DataClassification = CustomerContent;
//         }
//         field(8; "No. of quad rooms"; Integer)
//         {
//             Caption = 'No. of quad rooms';
//             DataClassification = CustomerContent;
//         }
//     }
//     keys
//     {
//         key(PK; "No.")
//         {
//             Clustered = true;
//         }
//     }
// }
