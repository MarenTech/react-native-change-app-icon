import { NativeModules } from 'react-native';

/**
 * 
 * @param iconName 
 * @returns 
 * 
 * #### Reset Primary App Icon Example
 *
 * Pass empty string to reset Original App Icon
 * ```js
 * changeIcon(""); || changeIcon();
 * ```
 *
 * #### Change App Icon Example
 *
 * Pass empty string to reset Original App Icon
 * ```js
 * changeIcon("ExampleIcon1");
 * ```
 * 
 */
const changeIcon = (iconName: string): Promise<string> =>
  NativeModules.ChangeIcon.changeIcon(iconName);

export { changeIcon };
