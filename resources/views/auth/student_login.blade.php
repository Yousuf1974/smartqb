<x-guest-layout>
    <x-auth-card>
        <x-slot name="logo">
            <a href="/">
                <x-application-logo class="w-20 h-20 fill-current text-gray-500" />
            </a>
        </x-slot>

        <!-- Session Status -->
        <x-auth-session-status class="mb-4" :status="session('status')" />

        <x-auth-session-status class="mb-4 text-red-500" :status="session('message')" />
        
        <!-- Validation Errors -->
        <x-auth-validation-errors class="mb-4" :errors="$errors" />

        <form method="POST" action="{{ route('student_login') }}">
            @csrf
            <!-- Unique Id -->
            <div>
                <x-label for="unique_id" :value="__('Unique Id')" />

                <x-input id="unique_id" class="block mt-1 w-full" type="tel" name="unique_id" :value="old('unique_id')" required autofocus />
            </div>

            <!-- Pin -->
            <div class="mt-4">
                <x-label for="pin" :value="__('Pin')" />

                <x-input id="pin" class="block mt-1 w-full"
                                type="password"
                                name="pin"
                                required />
            </div>

            <!-- Remember Me -->

            <div class="flex items-center justify-end mt-4">
                @if (Route::has('login'))
                    <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('login') }}">
                        {{ __('Admin Login') }}
                    </a>
                @endif
                <x-button class="ml-3">
                    {{ __('Log in') }}
                </x-button>
            </div>
        </form>
    </x-auth-card>
</x-guest-layout>
