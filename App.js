import { StatusBar } from 'expo-status-bar';
import { Button, StyleSheet, Text, View } from 'react-native';
import {hello, PI, setValueAsync, startVerification} from './modules/expo-enqura'
import { preventAutoHideAsync, hideAsync} from 'expo-splash-screen'
import { useEffect } from 'react';

preventAutoHideAsync()

export default function App() {


  useEffect(() => {
    setTimeout(() => {
      hideAsync()
    }, 5000);
  }, [])

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
        startVerification("asdasd")
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
