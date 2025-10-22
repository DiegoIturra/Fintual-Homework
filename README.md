
# 💼 Rebalance de portafolio (Ruby)

Este proyecto implementa una **clase `Portfolio`** en Ruby que simula la composición de un portafolio de acciones (`Stocks`) y permite **rebalancearlo automáticamente** según una distribución objetivo de porcentajes.

El objetivo es identificar **cuántas unidades de cada acción deberían comprarse o venderse** para alcanzar la proporción deseada dentro del portafolio.

---

## 🧩 Enunciado del ejercicio

> **Construct a simple Portfolio class that has a collection of Stocks.**
>
> Assume each Stock has a “Current Price” method that receives the last available price.  
> Also, the Portfolio class has a collection of “allocated” Stocks that represents the distribution of the Stocks the Portfolio is aiming (i.e., 40% META, 60% AAPL).  
>
> **Provide a portfolio rebalance method** to know which Stocks should be sold and which ones should be bought to have a balanced Portfolio based on the portfolio’s allocation.
>
> Add documentation/comments to understand your thinking process and solution.  
> **Important:** If you use LLMs that’s ok, but you must share the conversations.

---

## 🚀 Conversación con LLM's

Se adjuntan los links de chatGPT para entender mas a fondo el problema del rebalanceo.

https://chatgpt.com/share/68f8f8c4-9da8-8003-9f86-af70f9989d4d
https://chatgpt.com/share/68f8f0e5-7ce4-8003-b1cd-13ec45eaa706
 


## 🚀 Ejecución del código

### 📋 Requisitos
- Tener instalado **Ruby** (versión 2.7 o superior).  
  Puedes verificar tu versión ejecutando:
  ```bash
  ruby -v
- Clonar repositorio
   ```bash
   git clone https://github.com/DiegoIturra/Fintual-Homework.git
   cd Fintual-Homework
 - Ejecutar código
   ```bash
   ruby main.rb
