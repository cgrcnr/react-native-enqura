import { StatusBar } from 'expo-status-bar';
import { Button, StyleSheet, Text, View } from 'react-native';
import {hello, PI, setValueAsync} from './modules/expo-enqura'

export default function App() {
  return (
    <View style={styles.container}>
      {/* <Text>Open up App.js to start working on your app!</Text> */}
      <StatusBar style="auto" />

      <Button title='native module toast from pod' onPress={() => {
        setValueAsync("test")
        // const result = hello()
        //alert(result)
      }} />
      <Button title='native module prop number PI' onPress={() => {
        alert(PI)
      }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
