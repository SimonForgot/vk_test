- vkEnumerateDeviceExtensionProperties列举物理设备支持的扩展，指光追什么的,它和instance扩展不一样

- Property和Feature所代表的物理设备的能力还不太一样：
```
VkPhysicalDeviceProperties deviceProperties;
VkPhysicalDeviceFeatures deviceFeatures;
vkGetPhysicalDeviceProperties(device, &deviceProperties);
vkGetPhysicalDeviceFeatures(device, &deviceFeatures);

return deviceProperties.deviceType == VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU &&
        deviceFeatures.geometryShader;
```
vulkanCapsViewer.exe里面可以查看

- VkDeviceQueueCreateInfo结构体。这一结构体描述了针对一个队列族我们所需的队列数量。也就是说，如果这个设备支持有3个family，那这个创建信息也就最多有3个，多了没意义。family中可赋予族中队列不同优先级，不过一般用不上同个family多个queue。


- 以前的 Vulkan 实现对特定于实例和设备的验证层进行了区分，但现在情况已不再如此。这意味着最新的实现会忽略enabledLayerCount和ppEnabledLayerNames字段

- 创建logic device时，相关的扩展是物理设备扩展，比如VK_KHR_swapchain。这也表明逻辑设备是对物理设备的抽象.

- 队列（queue）接收Command buffers（简称commands），把它们排成队来依次开始执行，但不保证结束顺序