import React from "react"
import { Button, StyleSheet, Text, View } from "react-native"

export default function TabView3() {
  return (
    <View style={styles.container}>
      <Text>TabView 3</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
})