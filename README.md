### Init Steps

To get started with the Flight Distance project, follow these initial steps:

1. **Create Scratch Org**:
    Replace `ALIAS` and `EMAIL` with respective values.
    ```
    sf org create scratch -f config/project-scratch-def.json --set-default -a ALIAS --duration-days 30 -v EMAIL
    ```

2. **Deploy Project**:
    ```
    sf project deploy start
    ```

3. **Assign Permission Set**:
    ```
    sf org assign permset --name "Flight_Distance"
    ```

4. **Run the Apex Script to Load Arports Data**:
    ```
    sf apex run -f scripts/apex/loadAirports.apex
    ```

5. **Open**:
    ```
    sf org open --browser chrome
    ```

6. **Use**:
    Navigate to `Flight Distance` app via App Launcher and a create new Flight

