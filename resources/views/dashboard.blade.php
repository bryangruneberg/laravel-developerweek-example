<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <p class="my-4">You're logged in, {{ Auth::user()->name }}! </p>
                    <p class="my-4">Here is a Lagoon!</p>
                    <div class="text-center">
                        <img src="/aioteam.gif" class="mx-auto" />
                       <!-- <img src="/lagoon.gif" class="mx-auto" /> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
