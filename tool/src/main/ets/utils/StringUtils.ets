
/**
 * 字符串工具类
 * 提供字符串格式化、验证、转换等功能
 *

 */
export class StringUtils {
  /**
   * 检查字符串是否为空
   *
   * @param {string} str - 待检查的字符串
   * @returns {boolean} 是否为空
   *
   * @example
  * ```
   * StringUtils.isEmpty('');      // true
   * StringUtils.isEmpty('  ');    // true
   * StringUtils.isEmpty('hello'); // false
   * ```
   */
  static isEmpty(str: string): boolean {
    return !str || str.trim().length === 0;
  }

  /**
   * 检查字符串是否为邮箱格式
   *
   * @param {string} email - 邮箱地址
   * @returns {boolean} 是否为邮箱格式
   *
   * @example
  * ```
   * StringUtils.isEmail('test@example.com'); // true
   * StringUtils.isEmail('invalid-email');    // false
   * ```
   */
  static isEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  /**
   * 检查字符串是否为手机号格式
   *
   * @param {string} phone - 手机号码
   * @returns {boolean} 是否为手机号格式
   *
   * @example
  * ```
   * StringUtils.isPhone('13800138000'); // true
   * StringUtils.isPhone('123456');      // false
   * ```
   */
  static isPhone(phone: string): boolean {
    const phoneRegex = /^1[3-9]\d{9}$/;
    return phoneRegex.test(phone);
  }

  /**
   * 字符串脱敏处理
   *
   * @param {string} str - 原始字符串
   * @param {number} start - 开始保留的字符数
   * @param {number} end - 结尾保留的字符数
   * @param {string} maskChar - 脱敏字符
   * @returns {string} 脱敏后的字符串
   *
   * @example
  * ```
   * StringUtils.mask('13800138000', 3, 4); // '138****8000'
   * StringUtils.mask('张三', 1, 0);         // '张*'
   * ```
   */
  static mask(str: string, start: number = 3, end: number = 4, maskChar: string = '*'): string {
    if (StringUtils.isEmpty(str) || str.length <= start + end) {
      return str;
    }

    const startStr = str.substring(0, start);
    const endStr = str.substring(str.length - end);
    const maskLength = str.length - start - end;

    return startStr + maskChar.repeat(maskLength) + endStr;
  }

  /**
   * 首字母大写
   *
   * @param {string} str - 原始字符串
   * @returns {string} 首字母大写的字符串
   *
   * @example
  * ```
   * StringUtils.capitalize('hello'); // 'Hello'
   * StringUtils.capitalize('WORLD');  // 'World'
   * ```
   */
  static capitalize(str: string): string {
    if (StringUtils.isEmpty(str)) return str;
    return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
  }

  /**
   * 驼峰命名转下划线命名
   *
   * @param {string} str - 驼峰命名字符串
   * @returns {string} 下划线命名字符串
   *
   * @example
  * ```
   * StringUtils.camelToSnake('userName');    // 'user_name'
   * StringUtils.camelToSnake('HTTPRequest'); // 'http_request'
   * ```
   */
  static camelToSnake(str: string): string {
    return str.replace(/([A-Z])/g, '_$1').toLowerCase();
  }

  /**
   * 下划线命名转驼峰命名
   *
   * @param {string} str - 下划线命名字符串
   * @returns {string} 驼峰命名字符串
   *
   * @example
  * ```
   * StringUtils.snakeToCamel('user_name');    // 'userName'
   * StringUtils.snakeToCamel('http_request'); // 'httpRequest'
   * ```
   */
  static snakeToCamel(str: string): string {
    return str.replace(/_([a-z])/g, (_: string, letter: string): string => letter.toUpperCase());
  }


  /**
   * 截取字符串，超出部分用省略号表示
   *
   * @param {string} str - 原始字符串
   * @param {number} maxLength - 最大长度
   * @param {string} suffix - 后缀
   * @returns {string} 截取后的字符串
   *
   * @example
  * ```
   * StringUtils.truncate('这是一段很长的文本', 5); // '这是一段...'
   * StringUtils.truncate('Hello', 10);            // 'Hello'
   * ```
   */
  static truncate(str: string, maxLength: number, suffix: string = '...'): string {
    if (StringUtils.isEmpty(str) || str.length <= maxLength) {
      return str;
    }
    return str.substring(0, maxLength) + suffix;
  }

  /**
   * 生成随机字符串
   *
   * @param {number} length - 字符串长度
   * @returns {string} 随机字符串
   *
   * @example
  * ```
   * StringUtils.random(8); // 'aB3xY9zM'
   * ```
   */
  static random(length: number = 8): string {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < length; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  }

  /**
   * 去除字符串中的HTML标签
   *
   * @param {string} html - 包含HTML的字符串
   * @returns {string} 纯文本字符串
   *
   * @example
  * ```
   * StringUtils.stripHtml('<p>Hello</p>'); // 'Hello'
   * ```
   */
  static stripHtml(html: string): string {
    return html.replace(/<[^>]*>/g, '');
  }
}
