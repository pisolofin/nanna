namespace Nanna.Example.ApplicationWeb.Devices.Entities;

public enum DeviceType
{
    Unknown = 0,
    Phone = 1,
    Tablet = 2,
    Laptop = 3,
    Desktop = 4,
    Server = 5,
    IoT = 6,
    Other = 7
}

//public partial class Device
//{
//    public int Id { get; set; }
//    public string Name { get; set; } = String.Empty;
//    public DeviceType DeviceType { get; set; }
//}

public partial record Device(string Name, DeviceType DeviceType, int manufactureId)
{
    public int Id { get; init; }
};