using Nanna.Example.ApplicationWeb.Devices.Entities;

namespace Nanna.Example.ApplicationWeb.Dtos;

public partial record DeviceResponse(int Id, string Name, DeviceType DeviceType);
//{
//    public int Id { get; set; }
//    public string Name { get; set; } = String.Empty;
//    public DeviceType DeviceType { get; set; }
//}
