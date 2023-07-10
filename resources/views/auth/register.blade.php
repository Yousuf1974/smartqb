<x-guest-layout>
    <x-auth-card>
        <x-slot name="logo">
            <a href="/">
                <x-application-logo class="w-20 h-20 fill-current text-gray-500" />
            </a>
        </x-slot>
        
        <!-- Validation Errors -->
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
        
        <form method="POST" action="{{ route('register') }}">
            <h4 class="text-center">{{config('app.name')}}</h4>
            @csrf
            <input type="hidden" name="institution_user" value="yes" >
            @if(request()->has('institution_id') && request()->input('institution_id')) 
                <input type="hidden" name="institution_id" value="{{request('institution_id')}}">
            @endif
            <!-- Name -->
            <div>
                <x-label for="name" :value="__('Name*')" />

                <x-input id="name" class="block mt-1 w-full text-xs text-zinc-300" type="text" name="name" :value="old('name')" placeholder="আপনার নাম লিখুন" required autofocus />
            </div>

            <!-- Phone Address -->
            <div class="mt-4">
                <x-label for="phone" :value="__('Phone Number*')" />
                <x-input id="phone" class="block mt-1 w-full text-xs" type="tel" name="phone" :value="old('phone')" placeholder="আপনার মোবাইল নাম্বার লিখুন" required />
            </div>

            <!-- Email Address -->
            <div class="mt-4">
                <x-label for="email" :value="__('Email')" />

                <x-input id="email" class="block mt-1 w-full text-xs" type="email" name="email" :value="old('email')" placeholder="আপনার ই-মেইল লিখুন(যদি থাকে)" />
            </div>

            <!-- Password -->
            <div class="mt-4">
                <x-label for="password" :value="__('Password*')" />

                <x-input id="password" class="block mt-1 w-full text-xs"
                                type="password"
                                name="password"
                                required autocomplete="new-password" placeholder="পাসওয়ার্ড দিন" />
            </div>

            <!-- Confirm Password -->
            <div class="mt-4">
                <x-label for="password_confirmation" :value="__('Confirm Password*')" />

                <x-input id="password_confirmation" class="block mt-1 w-full text-xs"
                                type="password"
                                name="password_confirmation" required placeholder="পুনরায় পাসওয়ার্ডটি দিন" />
            </div>

            <div class="flex items-center justify-end mt-4">
                <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('login') }}">
                    {{ __('Already registered?') }}
                </a>

                <x-button class="ml-4">
                    {{ __('Register') }}
                </x-button>
            </div>
        </form>
    </x-auth-card>
</x-guest-layout>
