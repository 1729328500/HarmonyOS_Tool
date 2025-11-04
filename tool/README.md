
# whyh_tool

## 简介
whyh_tool 是一个适用于 HarmonyOS 应用开发的工具类模块，提供了日期处理、日志打印等常用功能，帮助开发者简化日常开发中的重复工作，提高开发效率。

## 安装
```bash
ohpm install whyh_tool
```

## 使用
### 1. 日期处理功能示例
```typescript
import { DateUtil } from 'whyh_tool';

// 获取当前日期（格式：yyyy-MM-dd）
const currentDate = DateUtil.getCurrentDate();
console.log('当前日期：', currentDate);

// 计算两个日期之间的天数差
const date1 = '2024-01-01';
const date2 = '2024-01-10';
const dayDiff = DateUtil.getDayDiff(date1, date2);
console.log('日期差：', dayDiff, '天');
```

### 2. 日志打印功能示例
```typescript
import { Logger } from 'whyh_tool';

// 打印信息级日志
Logger.info('ModuleA', '初始化成功');

// 打印错误级日志
try {
  // 业务逻辑代码
} catch (error) {
  Logger.error('ModuleB', '处理失败', error);
}
```


