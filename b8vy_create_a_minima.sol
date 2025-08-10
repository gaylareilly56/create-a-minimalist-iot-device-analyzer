pragma solidity ^0.8.0;

/**
 * @title Minimalist IoT Device Analyzer
 * @author b8vy
 * @notice This contract analyzes and stores IoT device data in a minimalistic way
 */

contract IoTDeviceAnalyzer {
    // Mapping to store device data
    mapping (address => DeviceData) public deviceData;

    // Structure to store device data
    struct DeviceData {
        uint256 deviceId;
        string deviceName;
        uint256[] sensorData;
        uint256 timestamp;
    }

    /**
     * @dev Add new device data
     * @param _deviceId Unique device ID
     * @param _deviceName Device name
     * @param _sensorData Sensor readings
     */
    function addDeviceData(uint256 _deviceId, string calldata _deviceName, uint256[] calldata _sensorData) public {
        deviceData[msg.sender] = DeviceData(_deviceId, _deviceName, _sensorData, block.timestamp);
    }

    /**
     * @dev Get device data by address
     * @param _address Device owner address
     * @return Device data
     */
    function getDeviceData(address _address) public view returns (DeviceData memory) {
        return deviceData[_address];
    }

    /**
     * @dev Get all device data
     * @return Array of device data
     */
    function getAllDeviceData() public view returns (DeviceData[] memory) {
        DeviceData[] memory allData = new DeviceData[](deviceData.length);
        for (uint256 i = 0; i < deviceData.length; i++) {
            allData[i] = deviceData[address(i)];
        }
        return allData;
    }
}