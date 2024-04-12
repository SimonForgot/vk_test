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

- 创建logic device时，所说的扩展指的就是是物理设备扩展，比如VK_KHR_swapchain。这也表明逻辑设备是对物理设备的抽象.

- 队列（queue）接收Command buffers（简称commands），把它们排成队来依次开始执行，但不保证结束顺序


- 感觉立即模式的swap chain的机制有点像，应用程序和显示屏都有指向显存的指针。然后由CPU控制 GPU写和显示器读 的指针切换.

- vertical blank在现代指可以安全的切换显示器要显示的图的那段时间，vertical blank period指两次vertical blank之间的间隔时间。

- G-Sync 和 Free Sync指的就是自适应刷新率

- VkSwapchainCreateInfoKHR得到imageUsage可以指定图像从计算着色器而不是渲染管线获得

- AMD:Anti-Lag ：存在于OpenGL驱动，vulkan里没有，需要开发者自己用fence来做。这种延迟现象的来源很大程度上是由于，CPU比GPU要快，导致任务队列积压，GPU无法及时处理和显示最新的CPU传来的输入数据。