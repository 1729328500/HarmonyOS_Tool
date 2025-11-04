import { describe, expect, it } from '@ohos/hypium';
import { StringUtils } from '../main/ets/utils/StringUtils';


export default function UtilsTest() {
  describe('StringUtilsTest', () => {
    it('should_detect_empty_string', 0, () => {
      expect(StringUtils.isEmpty('')).assertEqual(true);
      expect(StringUtils.isEmpty('  ')).assertEqual(true);
      expect(StringUtils.isEmpty('hello')).assertEqual(false);
    });

    it('should_validate_email_format', 0, () => {
      expect(StringUtils.isEmail('test@example.com')).assertEqual(true);
      expect(StringUtils.isEmail('invalid-email')).assertEqual(false);
    });

    it('should_mask_sensitive_info', 0, () => {
      expect(StringUtils.mask('13800138000', 3, 4)).assertEqual('138****8000');
      expect(StringUtils.mask('张三', 1, 0)).assertEqual('张*');
    });
  });

}
