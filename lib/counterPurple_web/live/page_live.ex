defmodule CounterPurpleWeb.CounterPurpleWebLive do
    use CounterPurpleWeb, :live_view

    def render(assigns) do
      ~H"""
          <div class="flex flex-col items-center justify-center h-screen bg-gray-200">
            <h1 class="text-5xl font-medium text-gray-700">Counter</h1>

            <span class="m-5 text-9xl">
              <span class="m-5 text-9xl">
              <%= @number %>
            </span>
            </span>
            
            <section> 
              <button phx-click="dec" class="text-white text-4xl bg-indigo-600 px-6 py-4 rounded hover:bg-indigo-900">-</button>

              <button phx-click="clear" class="m-10 text-white text-4xl bg-indigo-900 px-6 py-4 rounded hover:bg-indigo-500">clear</button>

              <button phx-click="inc" class="text-white text-4xl bg-indigo-600 px-6 py-4 rounded hover:bg-indigo-900">+</button>
            </section>
          </div>
      """
    end

    def mount(_params, _session, socket) do
        {:ok,
         socket
         |> assign(number: 0)}
    end

    def handle_event("inc", _params, socket) do
      {:noreply,
       socket
       |> update(:number, &(&1 + 1))}
    end

    def handle_event("dec", _params, socket) do
      {:noreply,
       socket
       |> update(:number, &max(0, &1 - 1))}
    end

    def handle_event("clear", _params, socket) do
      {:noreply, socket |> assign(number: 0)}
    end
end

  