using Nanna.Example.ApplicationWeb.Devices.Entities;

namespace Nanna.Example.ApplicationWeb.Dtos;

//public class DeviceCreate
//{
//    public string Name { get; set; }
//    public DeviceType DeviceType { get; set; }
//}

public record DeviceCreate(string Name, DeviceType DeviceType, int ManufactureId);
