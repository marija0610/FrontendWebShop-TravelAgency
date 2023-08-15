codeunit 50306 "RoomGenerator"
{
    TableNo = Item;
    trigger OnRun()
    var
        i: Integer;
    begin
        for i := 1 to Rec."No. of single rooms" do
            CreateRoom(Rec."No.", 1, 100 + i, "Room Type"::"Single");
        for i := 1 to Rec."No. of double rooms" do
            CreateRoom(Rec."No.", 2, 200 + i, "Room Type"::"Double");
        for i := 1 to Rec."No. of triple rooms" do
            CreateRoom(Rec."No.", 3, 300 + i, "Room Type"::"Triple");
        for i := 1 to Rec."No. of quad rooms" do
            CreateRoom(Rec."No.", 4, 400 + i, "Room Type"::"Quad");
        Message('Hotel Rooms are sucessfully generated.');
    end;

    local procedure CreateRoom(HotelNo: Code[20]; FloorNo: Integer; RoomNo: Integer; RoomType: Enum "Room Type")
    var
        Room: Record Room;
    begin
        Room.Init();
        Room."No." := RoomNo;
        Room."Hotel Entry No." := HotelNo;
        Room.Floor := FloorNo;
        Room.Type := RoomType;
        Room.Insert(true);
    end;

}